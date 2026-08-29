private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum VectorDistanceFunction
    Cosine
    DotProduct
    Euclidean

    def self.to_json(e : VectorDistanceFunction, json : JSON::Builder) : Nil
      value = case e
              when ADDB::VectorDistanceFunction::Cosine     then "COSINE"
              when ADDB::VectorDistanceFunction::DotProduct then "DOT_PRODUCT"
              when ADDB::VectorDistanceFunction::Euclidean  then "EUCLIDEAN"
              else
                raise Exception.new("unknown enum value for 'VectorDistanceFunction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::VectorDistanceFunction
      value = pull.read_string
      case value
      when "COSINE"      then ADDB::VectorDistanceFunction::Cosine
      when "DOT_PRODUCT" then ADDB::VectorDistanceFunction::DotProduct
      when "EUCLIDEAN"   then ADDB::VectorDistanceFunction::Euclidean
      else
        raise Exception.new("unknown enum value for 'VectorDistanceFunction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::VectorDistanceFunction::Cosine     then "COSINE"
      when ADDB::VectorDistanceFunction::DotProduct then "DOT_PRODUCT"
      when ADDB::VectorDistanceFunction::Euclidean  then "EUCLIDEAN"
      else
        raise Exception.new("unknown enum value for 'VectorDistanceFunction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::VectorDistanceFunction?
      case key
      when "COSINE"      then ADDB::VectorDistanceFunction::Cosine
      when "DOT_PRODUCT" then ADDB::VectorDistanceFunction::DotProduct
      when "EUCLIDEAN"   then ADDB::VectorDistanceFunction::Euclidean
      else
        nil
      end
    end
  end
end
