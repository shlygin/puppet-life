Facter.add(:life_points) do
  setcode do
    if File.exist? "/etc/life.yaml"
      life = YAML.load_file("/etc/life.yaml")
      if life["field"].nil?
        max_x = 100
        max_y = 100
      else
        if life["field"]["x"].nil?
          max_x = 100
        else
          max_x = life["field"]["x"]
        end
        if life["field"]["y"].nil?
          max_y = 100
        else
          max_y = life["field"]["y"]
        end
      end
      life_points = []
      max_y.times do
        temp = []
        max_x.times do
          temp << 0
        end
        life_points << temp
      end
      if not life["life"].nil?
        life["life"].each do |name, pos|
          if not (pos["x"].nil? or pos["y"].nil?)
            if pos["x"] >=0 and pos["y"] >=0 and pos["x"] <= max_x and pos["y"] <= max_y then
              life_points[pos["y"]][pos["x"]] = 1
            end
          end
        end
      end

      life_points
    end
  end
end
