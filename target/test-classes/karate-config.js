function fn() {
var env = karate.env;
  if (!env) { env = 'dev'; }  // default when karate.env not set

  // base config
  var config = {
    env: env,
    baseUrl: 'https://api.weatherbit.io/v2.0/current',
    apiKey: 'f767c102bb874909878729858a9ca968'
  }

karate.log('karate.env =', karate.env);
  karate.log('config.baseUrl =', config.baseUrl);
  karate.log('config.apiKey =', config.apiKey);

  return config;
}