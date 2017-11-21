require 'spec_helper'

describe 'life::save' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { {
        'life_field' => [ [ 0, 0], [0, 0] ],
        'life_size' => {
          'x' => '2',
          'y' => '2'
        }
      } }

      it { is_expected.to compile }
    end
  end
end
