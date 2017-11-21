# life
#
# A Game of Life realization class
#
# Calls life::next if there is existing field state.
# Otherwise calls life::first to initialize.
#
# @example
#   include life
class life (
  Integer $max_size_x,
  Integer $max_size_y,
) {

  if defined('$::life_points') and defined('$::life_size') {
    class { 'life::next': }
  } else {
    class { 'life::first':
      max_size_x => $max_size_x,
      max_size_y => $max_size_y
    }
  }

}
