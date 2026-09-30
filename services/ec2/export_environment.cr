private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ExportEnvironment
    Citrix
    Vmware
    Microsoft

    def self.to_json(e : ExportEnvironment, json : JSON::Builder) : Nil
      value = case e
              when AEC::ExportEnvironment::Citrix    then "citrix"
              when AEC::ExportEnvironment::Vmware    then "vmware"
              when AEC::ExportEnvironment::Microsoft then "microsoft"
              else
                raise Exception.new("unknown enum value for 'ExportEnvironment' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ExportEnvironment
      value = pull.read_string
      case value
      when "citrix"    then AEC::ExportEnvironment::Citrix
      when "vmware"    then AEC::ExportEnvironment::Vmware
      when "microsoft" then AEC::ExportEnvironment::Microsoft
      else
        raise Exception.new("unknown enum value for 'ExportEnvironment' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ExportEnvironment::Citrix    then "citrix"
      when AEC::ExportEnvironment::Vmware    then "vmware"
      when AEC::ExportEnvironment::Microsoft then "microsoft"
      else
        raise Exception.new("unknown enum value for 'ExportEnvironment' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ExportEnvironment?
      case key
      when "citrix"    then AEC::ExportEnvironment::Citrix
      when "vmware"    then AEC::ExportEnvironment::Vmware
      when "microsoft" then AEC::ExportEnvironment::Microsoft
      else
        nil
      end
    end
  end
end
