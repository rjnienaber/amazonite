private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ArchitectureValues
    I386
    X8664
    Arm64
    X8664Mac
    Arm64Mac

    def self.to_json(e : ArchitectureValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::ArchitectureValues::I386     then "i386"
              when AEC::ArchitectureValues::X8664    then "x86_64"
              when AEC::ArchitectureValues::Arm64    then "arm64"
              when AEC::ArchitectureValues::X8664Mac then "x86_64_mac"
              when AEC::ArchitectureValues::Arm64Mac then "arm64_mac"
              else
                raise Exception.new("unknown enum value for 'ArchitectureValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ArchitectureValues
      value = pull.read_string
      case value
      when "i386"       then AEC::ArchitectureValues::I386
      when "x86_64"     then AEC::ArchitectureValues::X8664
      when "arm64"      then AEC::ArchitectureValues::Arm64
      when "x86_64_mac" then AEC::ArchitectureValues::X8664Mac
      when "arm64_mac"  then AEC::ArchitectureValues::Arm64Mac
      else
        raise Exception.new("unknown enum value for 'ArchitectureValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ArchitectureValues::I386     then "i386"
      when AEC::ArchitectureValues::X8664    then "x86_64"
      when AEC::ArchitectureValues::Arm64    then "arm64"
      when AEC::ArchitectureValues::X8664Mac then "x86_64_mac"
      when AEC::ArchitectureValues::Arm64Mac then "arm64_mac"
      else
        raise Exception.new("unknown enum value for 'ArchitectureValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ArchitectureValues?
      case key
      when "i386"       then AEC::ArchitectureValues::I386
      when "x86_64"     then AEC::ArchitectureValues::X8664
      when "arm64"      then AEC::ArchitectureValues::Arm64
      when "x86_64_mac" then AEC::ArchitectureValues::X8664Mac
      when "arm64_mac"  then AEC::ArchitectureValues::Arm64Mac
      else
        nil
      end
    end
  end
end
