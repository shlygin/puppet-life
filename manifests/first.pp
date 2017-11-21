# life::first
#
# This class generates initial field state.
# Calls life::save to save it.
#
# Shouldn't be called directly
class life::first (
  Integer $max_size_x,
  Integer $max_size_y,
) {

  $life_first = life::generate($max_size_x, $max_size_y)

  class { 'life::save':
    life_field => $life_first,
    life_size  => {
      'x' => $max_size_x,
      'y' => $max_size_y
    }
  }
}
