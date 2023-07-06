data {
  int AY;
  int DL;
  matrix[AY,DL] loss;
  int prior_only;
}

parameters {
  real mu_ata;
  real<lower=0> sigma_ata;

  vector[DL-1] ata_pr;
  real sigma_int;
  real<upper=0> sigma_slope;
}

transformed parameters {
  vector<lower=0>[DL-1] ata;

  ata = exp(mu_ata + sigma_ata * ata_pr);
}

model {
  real mu;
  real sigma2;

  mu_ata ~ normal(0.0, 0.1);
  sigma_ata ~ normal(0.2, 0.1);
  ata_pr ~ std_normal();

  sigma_int ~ normal(-4, 1.0);
  sigma_slope ~ normal(-0.25, 0.25);

  
  if (prior_only==0) {
    for (dev_lag in 2:DL) {
      for (acc_year in 1:AY) {
        if ((dev_lag+acc_year) < 12) {
          mu = loss[acc_year,dev_lag-1] * ata[dev_lag-1];
          sigma2 = pow(exp(sigma_int + (dev_lag-1) * sigma_slope), 2);
          loss[acc_year,dev_lag] ~ gamma(pow(mu, 2) / sigma2, mu / sigma2);     
        }
      }
    }
  }
}

generated quantities {
  matrix[AY, DL] pred_loss;
  real mu;
  real sigma2;

  pred_loss[:, 1] = loss[:, 1]; 

  for (dev_lag in 2:DL) {
    for (acc_year in 1:AY) {
      mu = (dev_lag+acc_year < 12 ? loss[acc_year,dev_lag-1] : pred_loss[acc_year,dev_lag-1]) * ata[dev_lag-1];
      sigma2 = pow(exp(sigma_int + (dev_lag-1) * sigma_slope), 2);
      pred_loss[acc_year,dev_lag] = gamma_rng(pow(mu, 2) / sigma2, mu / sigma2);    
    }
  }
}
