require 'spec_helper'
describe 'logstash' do
  context 'with default values for all parameters' do
    it { should contain_class('logstash') }
  end
end
