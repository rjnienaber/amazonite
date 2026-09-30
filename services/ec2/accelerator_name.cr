private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AcceleratorName
    A100
    Inferentia
    K520
    K80
    M60
    RadeonProV520
    T4
    Vu9p
    V100
    A10g
    H100
    T4g
    L40s
    L4
    GaudiHl205
    Inferentia2
    Trainium
    Trainium2
    U30

    def self.to_json(e : AcceleratorName, json : JSON::Builder) : Nil
      value = case e
              when AEC::AcceleratorName::A100          then "a100"
              when AEC::AcceleratorName::Inferentia    then "inferentia"
              when AEC::AcceleratorName::K520          then "k520"
              when AEC::AcceleratorName::K80           then "k80"
              when AEC::AcceleratorName::M60           then "m60"
              when AEC::AcceleratorName::RadeonProV520 then "radeon-pro-v520"
              when AEC::AcceleratorName::T4            then "t4"
              when AEC::AcceleratorName::Vu9p          then "vu9p"
              when AEC::AcceleratorName::V100          then "v100"
              when AEC::AcceleratorName::A10g          then "a10g"
              when AEC::AcceleratorName::H100          then "h100"
              when AEC::AcceleratorName::T4g           then "t4g"
              when AEC::AcceleratorName::L40s          then "l40s"
              when AEC::AcceleratorName::L4            then "l4"
              when AEC::AcceleratorName::GaudiHl205    then "gaudi-hl-205"
              when AEC::AcceleratorName::Inferentia2   then "inferentia2"
              when AEC::AcceleratorName::Trainium      then "trainium"
              when AEC::AcceleratorName::Trainium2     then "trainium2"
              when AEC::AcceleratorName::U30           then "u30"
              else
                raise Exception.new("unknown enum value for 'AcceleratorName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AcceleratorName
      value = pull.read_string
      case value
      when "a100"            then AEC::AcceleratorName::A100
      when "inferentia"      then AEC::AcceleratorName::Inferentia
      when "k520"            then AEC::AcceleratorName::K520
      when "k80"             then AEC::AcceleratorName::K80
      when "m60"             then AEC::AcceleratorName::M60
      when "radeon-pro-v520" then AEC::AcceleratorName::RadeonProV520
      when "t4"              then AEC::AcceleratorName::T4
      when "vu9p"            then AEC::AcceleratorName::Vu9p
      when "v100"            then AEC::AcceleratorName::V100
      when "a10g"            then AEC::AcceleratorName::A10g
      when "h100"            then AEC::AcceleratorName::H100
      when "t4g"             then AEC::AcceleratorName::T4g
      when "l40s"            then AEC::AcceleratorName::L40s
      when "l4"              then AEC::AcceleratorName::L4
      when "gaudi-hl-205"    then AEC::AcceleratorName::GaudiHl205
      when "inferentia2"     then AEC::AcceleratorName::Inferentia2
      when "trainium"        then AEC::AcceleratorName::Trainium
      when "trainium2"       then AEC::AcceleratorName::Trainium2
      when "u30"             then AEC::AcceleratorName::U30
      else
        raise Exception.new("unknown enum value for 'AcceleratorName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AcceleratorName::A100          then "a100"
      when AEC::AcceleratorName::Inferentia    then "inferentia"
      when AEC::AcceleratorName::K520          then "k520"
      when AEC::AcceleratorName::K80           then "k80"
      when AEC::AcceleratorName::M60           then "m60"
      when AEC::AcceleratorName::RadeonProV520 then "radeon-pro-v520"
      when AEC::AcceleratorName::T4            then "t4"
      when AEC::AcceleratorName::Vu9p          then "vu9p"
      when AEC::AcceleratorName::V100          then "v100"
      when AEC::AcceleratorName::A10g          then "a10g"
      when AEC::AcceleratorName::H100          then "h100"
      when AEC::AcceleratorName::T4g           then "t4g"
      when AEC::AcceleratorName::L40s          then "l40s"
      when AEC::AcceleratorName::L4            then "l4"
      when AEC::AcceleratorName::GaudiHl205    then "gaudi-hl-205"
      when AEC::AcceleratorName::Inferentia2   then "inferentia2"
      when AEC::AcceleratorName::Trainium      then "trainium"
      when AEC::AcceleratorName::Trainium2     then "trainium2"
      when AEC::AcceleratorName::U30           then "u30"
      else
        raise Exception.new("unknown enum value for 'AcceleratorName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AcceleratorName?
      case key
      when "a100"            then AEC::AcceleratorName::A100
      when "inferentia"      then AEC::AcceleratorName::Inferentia
      when "k520"            then AEC::AcceleratorName::K520
      when "k80"             then AEC::AcceleratorName::K80
      when "m60"             then AEC::AcceleratorName::M60
      when "radeon-pro-v520" then AEC::AcceleratorName::RadeonProV520
      when "t4"              then AEC::AcceleratorName::T4
      when "vu9p"            then AEC::AcceleratorName::Vu9p
      when "v100"            then AEC::AcceleratorName::V100
      when "a10g"            then AEC::AcceleratorName::A10g
      when "h100"            then AEC::AcceleratorName::H100
      when "t4g"             then AEC::AcceleratorName::T4g
      when "l40s"            then AEC::AcceleratorName::L40s
      when "l4"              then AEC::AcceleratorName::L4
      when "gaudi-hl-205"    then AEC::AcceleratorName::GaudiHl205
      when "inferentia2"     then AEC::AcceleratorName::Inferentia2
      when "trainium"        then AEC::AcceleratorName::Trainium
      when "trainium2"       then AEC::AcceleratorName::Trainium2
      when "u30"             then AEC::AcceleratorName::U30
      else
        nil
      end
    end
  end
end
