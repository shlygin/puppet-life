Facter.add(:life_size) do
  setcode do
    if File.exist? "/etc/life.yaml"
      life = YAML.load_file("/etc/life.yaml")
      life_size = {}
      if life["field"].nil?
        life_size["x"] = 100
        life_size["y"] = 100
      else
        if life["field"]["x"].nil?
          life_size["x"] = 10
        else
          life_size["x"] = life["field"]["x"]
        end
        if life["field"]["y"].nil?
          life_size["y"] = 10
        else
          life_size["y"] = life["field"]["y"]
        end
      end
      life_size
    end
  end
end
