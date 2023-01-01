private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchProperty
    Product
    ProductFamily
    Classification
    MsrcSeverity
    Priority
    Severity

    def self.to_json(e : PatchProperty, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchProperty::Product        then "PRODUCT"
              when AS::PatchProperty::ProductFamily  then "PRODUCT_FAMILY"
              when AS::PatchProperty::Classification then "CLASSIFICATION"
              when AS::PatchProperty::MsrcSeverity   then "MSRC_SEVERITY"
              when AS::PatchProperty::Priority       then "PRIORITY"
              when AS::PatchProperty::Severity       then "SEVERITY"
              else
                raise Exception.new("unknown enum value for 'PatchProperty' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchProperty
      value = pull.read_string
      case value
      when "PRODUCT"        then AS::PatchProperty::Product
      when "PRODUCT_FAMILY" then AS::PatchProperty::ProductFamily
      when "CLASSIFICATION" then AS::PatchProperty::Classification
      when "MSRC_SEVERITY"  then AS::PatchProperty::MsrcSeverity
      when "PRIORITY"       then AS::PatchProperty::Priority
      when "SEVERITY"       then AS::PatchProperty::Severity
      else
        raise Exception.new("unknown enum value for 'PatchProperty' when deserializing from json: '#{value}'")
      end
    end
  end
end
