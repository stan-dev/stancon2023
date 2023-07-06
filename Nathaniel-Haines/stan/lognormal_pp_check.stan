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

generated quantities {
    vector[N] y_pred;

    for (i in 1:N) {
        y_pred[i] = lognormal_rng(mu, sigma);
    }
}