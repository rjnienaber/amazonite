private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ArchitectureType
    I386
    X8664
    Arm64
    X8664Mac
    Arm64Mac

    def self.to_json(e : ArchitectureType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ArchitectureType::I386     then "i386"
              when AEC::ArchitectureType::X8664    then "x86_64"
              when AEC::ArchitectureType::Arm64    then "arm64"
              when AEC::ArchitectureType::X8664Mac then "x86_64_mac"
              when AEC::ArchitectureType::Arm64Mac then "arm64_mac"
              else
                raise Exception.new("unknown enum value for 'ArchitectureType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ArchitectureType
      value = pull.read_string
      case value
      when "i386"       then AEC::ArchitectureType::I386
      when "x86_64"     then AEC::ArchitectureType::X8664
      when "arm64"      then AEC::ArchitectureType::Arm64
      when "x86_64_mac" then AEC::ArchitectureType::X8664Mac
      when "arm64_mac"  then AEC::ArchitectureType::Arm64Mac
      else
        raise Exception.new("unknown enum value for 'ArchitectureType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ArchitectureType::I386     then "i386"
      when AEC::ArchitectureType::X8664    then "x86_64"
      when AEC::ArchitectureType::Arm64    then "arm64"
      when AEC::ArchitectureType::X8664Mac then "x86_64_mac"
      when AEC::ArchitectureType::Arm64Mac then "arm64_mac"
      else
        raise Exception.new("unknown enum value for 'ArchitectureType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ArchitectureType?
      case key
      when "i386"       then AEC::ArchitectureType::I386
      when "x86_64"     then AEC::ArchitectureType::X8664
      when "arm64"      then AEC::ArchitectureType::Arm64
      when "x86_64_mac" then AEC::ArchitectureType::X8664Mac
      when "arm64_mac"  then AEC::ArchitectureType::Arm64Mac
      else
        nil
      end
    end
  end
end
