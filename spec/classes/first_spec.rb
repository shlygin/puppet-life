require 'spec_helper'

describe 'life::first' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { {
        'max_size_x' => 15,
        'max_size_y' => 15
      } }

      it { is_expected.to compile }
    end
  end
end
