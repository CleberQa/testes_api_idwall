# frozen_string_literal: true

require 'rspec'
require 'httparty'
require 'cucumber'
require 'pry'

ENV['ENV'] = 'dev' unless ENV.key? 'ENV'

ENVIRONMENT = YAML.load_file('./config/environment.yml')[ENV['ENV']]
AUTH = YAML.load_file('./config/authentication.yml')[ENV['ENV']]
DATA = YAML.load_file('./fixtures/default_data.yml')[ENV['ENV']]
MESSAGE = YAML.load_file('./fixtures/mensage.yml')[ENV['ENV']]