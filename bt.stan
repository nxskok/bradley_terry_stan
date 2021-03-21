// stolen from https://github.com/stan-dev/example-models/blob/master/knitr/bradley-terry/bradley-terry.Rmd
data {
  int<lower = 0> K;                     // players
  int<lower = 0> N;                     // matches
  int<lower=1, upper = K> player1[N];   // player 1 for game n
  int<lower=1, upper = K> player0[N];   // player 0 for game n
  int<lower = 0, upper = 1> y[N];       // winner for match n
}
parameters {
  vector[K] alpha;                      // ability for player n
}
model {
  alpha ~ normal(0, 3);
  y ~ bernoulli_logit(alpha[player1] - alpha[player0]);
}
