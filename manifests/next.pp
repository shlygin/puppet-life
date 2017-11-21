# life::next
#
# Generates next Life state.
# Calls life::save to save generated state.
#
# Shouldn't be called directly
class life::next {

  $life_current = $facts['life_points']

  $neighbours_num = $life_current.map |$posY, $row| {
    $row.map |$posX, $cell| {
      $neighbours = [
        $life_current.dig($posY - 1, $posX - 1).lest || { 0 },
        $life_current.dig($posY - 1, $posX).lest || { 0 },
        $life_current.dig($posY - 1, $posX + 1).lest || { 0 },
        $life_current.dig($posY, $posX - 1).lest || { 0 },
        $life_current.dig($posY, $posX + 1).lest || { 0 },
        $life_current.dig($posY + 1, $posX - 1).lest || { 0 },
        $life_current.dig($posY + 1, $posX).lest || { 0 },
        $life_current.dig($posY + 1, $posX + 1).lest || { 0 },
      ]

      $num = $neighbours.reduce |$sum, $nb| { $sum + $nb }
    }
  }

  $life_next = $life_current.map |$posY, $row| {
    $row.map |$posX, $cell| {
      if $neighbours_num[$posY][$posX] == 3 {
        $new = 1
      }
      elsif $cell != 0 and $neighbours_num[$posY][$posX] == 2 {
        $new = 1
      }
      else {
        $new = 0
      }
      $new
    }
  }

  class { 'life::save':
    life_field => $life_next,
    life_size  => $facts['life_size']
  }
}
