# life::save
#
# Saves new Life state to file storage.
#
# Shouldn't be called directly
class life::save (
  Array $life_field,
  Hash $life_size
) {

  file { '/etc/life.yaml':
    ensure  => file,
    content => epp('life/life.yaml.epp', {
      'life_field' => $life_field,
      'size' => $life_size
    }),
  }

  file { '/etc/life.txt':
    ensure  => file,
    content => epp('life/life.txt.epp', {
      'life_field' => $life_field
    }),
  }

}
