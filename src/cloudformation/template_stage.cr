private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum TemplateStage
    Original
    Processed

    def self.to_json(e : TemplateStage, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::TemplateStage
      value = pull.read_string
      case value
      when "Original"  then ACF::TemplateStage::Original
      when "Processed" then ACF::TemplateStage::Processed
      else
        raise Exception.new("unknown enum value for 'TemplateStage' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::TemplateStage?
      case key
      when "Original"  then ACF::TemplateStage::Original
      when "Processed" then ACF::TemplateStage::Processed
      else
        nil
      end
    end
  end
end
