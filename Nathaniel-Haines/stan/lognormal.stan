data {
    int N;
    vector[N] y;
}

parameters {
    real mu;
    real<lower=0> sigma;
}

model {
    mu ~ normal(0, 10);
    sigma ~ exponential(5);
    y ~ lognormal(mu, sigma);
}
