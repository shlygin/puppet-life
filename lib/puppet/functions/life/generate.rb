Puppet::Functions.create_function(:'life::generate') do
  dispatch :gen do
    param 'Integer', :max_x
    param 'Integer', :max_y
  end

  def gen(max_x, max_y)
    field = []
    max_y.times do
      temp = []
      max_x.times do
        temp << rand(2)
      end
      field << temp
    end
    field
  end
end
