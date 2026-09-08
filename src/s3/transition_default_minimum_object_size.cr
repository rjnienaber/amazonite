private alias AS = Amazonite::S3

module Amazonite::S3
  enum TransitionDefaultMinimumObjectSize
    VariesByStorageClass
    AllStorageClasses128k

    def self.to_json(e : TransitionDefaultMinimumObjectSize, json : JSON::Builder) : Nil
      value = case e
              when AS::TransitionDefaultMinimumObjectSize::VariesByStorageClass  then "varies_by_storage_class"
              when AS::TransitionDefaultMinimumObjectSize::AllStorageClasses128k then "all_storage_classes_128K"
              else
                raise Exception.new("unknown enum value for 'TransitionDefaultMinimumObjectSize' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::TransitionDefaultMinimumObjectSize
      value = pull.read_string
      case value
      when "varies_by_storage_class"  then AS::TransitionDefaultMinimumObjectSize::VariesByStorageClass
      when "all_storage_classes_128K" then AS::TransitionDefaultMinimumObjectSize::AllStorageClasses128k
      else
        raise Exception.new("unknown enum value for 'TransitionDefaultMinimumObjectSize' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::TransitionDefaultMinimumObjectSize::VariesByStorageClass  then "varies_by_storage_class"
      when AS::TransitionDefaultMinimumObjectSize::AllStorageClasses128k then "all_storage_classes_128K"
      else
        raise Exception.new("unknown enum value for 'TransitionDefaultMinimumObjectSize' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::TransitionDefaultMinimumObjectSize?
      case key
      when "varies_by_storage_class"  then AS::TransitionDefaultMinimumObjectSize::VariesByStorageClass
      when "all_storage_classes_128K" then AS::TransitionDefaultMinimumObjectSize::AllStorageClasses128k
      else
        nil
      end
    end
  end
end
