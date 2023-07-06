data {
  int N;
  int AY;
  int DL;
  array[N] matrix[AY,DL] loss;
  int prior_only;
}

parameters {
  real mu_ata_groupmean;
  real<lower=0> mu_ata_groupSD;

  real sigma_ata_groupmean;
  real<lower=0> sigma_ata_groupSD;

  vector[N] mu_ata_program_pr;
  vector[N] sigma_ata_program_pr;

  real sigma_int;
  real<lower=0> sigma_slope;
  array[N] vector[DL-1] ata_pr;
}

transformed parameters {
  vector[N] mu_ata_program;
  vector<lower=0>[N] sigma_ata_program;
  array[N] vector<lower=0>[DL-1] ata;

  mu_ata_program = mu_ata_groupmean + mu_ata_groupSD * mu_ata_program_pr;
  sigma_ata_program = exp(sigma_ata_groupmean + sigma_ata_groupSD * sigma_ata_program_pr);

  for (i in 1:N) {
    ata[i] = exp(mu_ata_program[i] + sigma_ata_program[i] * ata_pr[i]);
  }
}

model {
  real mu;
  real sigma2;

  mu_ata_groupmean ~ normal(-0.65, 0.25);
  mu_ata_groupSD ~ normal(0.0, 0.05);

  sigma_ata_groupmean ~ normal(0.0, 0.5);
  sigma_ata_groupSD ~ normal(1.0, 0.25);
  
  sigma_int ~ normal(-4.0, 1.0);
  sigma_slope ~ normal(0.25, 0.25);

  mu_ata_program_pr ~ std_normal();
  sigma_ata_program_pr ~ std_normal();

  for (i in 1:N) {
    ata_pr[i] ~ std_normal();
  }
  
  if (prior_only==0) {
    for (i in 1:N) {
      for (dev_lag in 2:DL) {
        for (acc_year in 1:AY) {
          if ((dev_lag+acc_year) < 12) {
            mu = loss[i][acc_year,dev_lag-1] * ata[i][dev_lag-1];
            sigma2 = pow(exp(sigma_int - sigma_slope * (dev_lag-1)), 2);
            loss[i][acc_year,dev_lag] ~ gamma(pow(mu, 2) / sigma2, mu / sigma2);     
          }
        }
      }
    }
  }
}

generated quantities {
  array[N] matrix[AY,DL] pred_loss;
  real mu;
  real sigma2;
  
  for (i in 1:N) {
    pred_loss[i][:, 1] = loss[i][:, 1]; 
  }
  
  for (i in 1:N) {
    for (dev_lag in 2:DL) {
      for (acc_year in 1:AY) {
        if ((dev_lag+acc_year) < 12) {
          mu = loss[i][acc_year,dev_lag-1] * ata[i][dev_lag-1];
        } else {
          mu = pred_loss[i][acc_year,dev_lag-1] * ata[i][dev_lag-1];
        }
        sigma2 = pow(exp(sigma_int - sigma_slope * (dev_lag-1)), 2);
        pred_loss[i][acc_year,dev_lag] = gamma_rng(pow(mu, 2) / sigma2, mu / sigma2);    
      }
    }
  }
}
