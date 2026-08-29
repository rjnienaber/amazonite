private alias AS = Amazonite::SnsV1

module Amazonite::SnsV1
  enum LanguageCodeString
    EnUs
    EnGb
    Es419
    EsEs
    DeDe
    FrCa
    FrFr
    ItIt
    JaJp
    PtBr
    KrKr
    ZhCn
    ZhTw

    def self.to_json(e : LanguageCodeString, json : JSON::Builder) : Nil
      value = case e
              when AS::LanguageCodeString::EnUs  then "en-US"
              when AS::LanguageCodeString::EnGb  then "en-GB"
              when AS::LanguageCodeString::Es419 then "es-419"
              when AS::LanguageCodeString::EsEs  then "es-ES"
              when AS::LanguageCodeString::DeDe  then "de-DE"
              when AS::LanguageCodeString::FrCa  then "fr-CA"
              when AS::LanguageCodeString::FrFr  then "fr-FR"
              when AS::LanguageCodeString::ItIt  then "it-IT"
              when AS::LanguageCodeString::JaJp  then "ja-JP"
              when AS::LanguageCodeString::PtBr  then "pt-BR"
              when AS::LanguageCodeString::KrKr  then "kr-KR"
              when AS::LanguageCodeString::ZhCn  then "zh-CN"
              when AS::LanguageCodeString::ZhTw  then "zh-TW"
              else
                raise Exception.new("unknown enum value for 'LanguageCodeString' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::LanguageCodeString
      value = pull.read_string
      case value
      when "en-US"  then AS::LanguageCodeString::EnUs
      when "en-GB"  then AS::LanguageCodeString::EnGb
      when "es-419" then AS::LanguageCodeString::Es419
      when "es-ES"  then AS::LanguageCodeString::EsEs
      when "de-DE"  then AS::LanguageCodeString::DeDe
      when "fr-CA"  then AS::LanguageCodeString::FrCa
      when "fr-FR"  then AS::LanguageCodeString::FrFr
      when "it-IT"  then AS::LanguageCodeString::ItIt
      when "ja-JP"  then AS::LanguageCodeString::JaJp
      when "pt-BR"  then AS::LanguageCodeString::PtBr
      when "kr-KR"  then AS::LanguageCodeString::KrKr
      when "zh-CN"  then AS::LanguageCodeString::ZhCn
      when "zh-TW"  then AS::LanguageCodeString::ZhTw
      else
        raise Exception.new("unknown enum value for 'LanguageCodeString' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::LanguageCodeString::EnUs  then "en-US"
      when AS::LanguageCodeString::EnGb  then "en-GB"
      when AS::LanguageCodeString::Es419 then "es-419"
      when AS::LanguageCodeString::EsEs  then "es-ES"
      when AS::LanguageCodeString::DeDe  then "de-DE"
      when AS::LanguageCodeString::FrCa  then "fr-CA"
      when AS::LanguageCodeString::FrFr  then "fr-FR"
      when AS::LanguageCodeString::ItIt  then "it-IT"
      when AS::LanguageCodeString::JaJp  then "ja-JP"
      when AS::LanguageCodeString::PtBr  then "pt-BR"
      when AS::LanguageCodeString::KrKr  then "kr-KR"
      when AS::LanguageCodeString::ZhCn  then "zh-CN"
      when AS::LanguageCodeString::ZhTw  then "zh-TW"
      else
        raise Exception.new("unknown enum value for 'LanguageCodeString' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::LanguageCodeString?
      case key
      when "en-US"  then AS::LanguageCodeString::EnUs
      when "en-GB"  then AS::LanguageCodeString::EnGb
      when "es-419" then AS::LanguageCodeString::Es419
      when "es-ES"  then AS::LanguageCodeString::EsEs
      when "de-DE"  then AS::LanguageCodeString::DeDe
      when "fr-CA"  then AS::LanguageCodeString::FrCa
      when "fr-FR"  then AS::LanguageCodeString::FrFr
      when "it-IT"  then AS::LanguageCodeString::ItIt
      when "ja-JP"  then AS::LanguageCodeString::JaJp
      when "pt-BR"  then AS::LanguageCodeString::PtBr
      when "kr-KR"  then AS::LanguageCodeString::KrKr
      when "zh-CN"  then AS::LanguageCodeString::ZhCn
      when "zh-TW"  then AS::LanguageCodeString::ZhTw
      else
        nil
      end
    end
  end
end
