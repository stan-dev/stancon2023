data {
  int N;
  int AY;
  array[N] vector[AY] ult_loss;
  array[N] vector[AY] ult_loss_sd;
  vector[N] ult_premium;
  int prior_only;
  int N_AY_pred;
}

transformed data {
  int N_AY_obs = AY - N_AY_pred;
}

parameters {
  real mu_target_lr;
  real<lower=0> sigma_target_lr;

  real reversion_pr;

  real sigma_int;
  real<lower=0> sigma_slope;

  vector[N] target_lr_pr;

  array[N] vector<lower=0>[N_AY_obs] true_ult_loss; 
}

transformed parameters {
  vector<lower=0>[N] target_lr;
  real<lower=-1,upper=1> reversion;

  target_lr = exp(mu_target_lr + sigma_target_lr * target_lr_pr);
  reversion = Phi_approx(reversion_pr)*2-1;
}

model {
  real mu;
  real sigma2;

  mu_target_lr ~ normal(-1.0, 0.5);
  sigma_target_lr ~ normal(0.0, 0.5);
  
  target_lr_pr ~ std_normal();
  reversion_pr ~ normal(0, 1);

  sigma_int ~ normal(-2.0, 1.0);
  sigma_slope ~ normal(0.0, 1.0);
  
  if (prior_only==0) {
    for (i in 1:N) {
      // measurement error model
      ult_loss[i][1:N_AY_obs] ~ gamma(
        pow(true_ult_loss[i],2)./pow(ult_loss_sd[i][1:N_AY_obs], 2), 
        true_ult_loss[i]./pow(ult_loss_sd[i][1:N_AY_obs], 2)
      );
      // likelihood
      for (acc_year in 2:N_AY_obs) {
        mu = reversion * true_ult_loss[i][acc_year-1] + (1-reversion) * target_lr[i];
        // mu = reversion * ult_loss[i][acc_year-1] + (1-reversion) * target_lr[i];
        sigma2 = pow(sigma_int + sigma_slope / ult_premium[i], 2);
        target += gamma_lpdf(true_ult_loss[i][acc_year] | pow(mu, 2) / sigma2, mu / sigma2);
        // target += gamma_lpdf(ult_loss[i][acc_year] | pow(mu, 2) / sigma2, mu / sigma2);
      }
    }
  }
}

generated quantities {
  array[N] vector[AY] pred_ult_loss;
  real mu;
  real sigma2;

  pred_ult_loss[:, 1] = ult_loss[:, 1]; 

  for (i in 1:N) {
    for (acc_year in 2:AY) { 
      if (acc_year>(N_AY_obs+1)) {
        mu = reversion * pred_ult_loss[i][acc_year-1] + (1-reversion) * target_lr[i];
      } else {
        mu = reversion * true_ult_loss[i][acc_year-1] + (1-reversion) * target_lr[i];
        // mu = reversion * ult_loss[i][acc_year-1] + (1-reversion) * target_lr[i];
      }
      sigma2 = pow(sigma_int + sigma_slope / ult_premium[i], 2);
      pred_ult_loss[i][acc_year] = gamma_rng(pow(mu, 2) / sigma2, mu / sigma2);    
    }
  }
}
