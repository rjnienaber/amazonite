private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchFilterKey
    Arch
    AdvisoryId
    BugzillaId
    PatchSet
    Product
    ProductFamily
    Classification
    CveId
    Epoch
    MsrcSeverity
    Name
    PatchId
    Section
    Priority
    Repository
    Release
    Severity
    Security
    Version

    def self.to_json(e : PatchFilterKey, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchFilterKey::Arch           then "ARCH"
              when AS::PatchFilterKey::AdvisoryId     then "ADVISORY_ID"
              when AS::PatchFilterKey::BugzillaId     then "BUGZILLA_ID"
              when AS::PatchFilterKey::PatchSet       then "PATCH_SET"
              when AS::PatchFilterKey::Product        then "PRODUCT"
              when AS::PatchFilterKey::ProductFamily  then "PRODUCT_FAMILY"
              when AS::PatchFilterKey::Classification then "CLASSIFICATION"
              when AS::PatchFilterKey::CveId          then "CVE_ID"
              when AS::PatchFilterKey::Epoch          then "EPOCH"
              when AS::PatchFilterKey::MsrcSeverity   then "MSRC_SEVERITY"
              when AS::PatchFilterKey::Name           then "NAME"
              when AS::PatchFilterKey::PatchId        then "PATCH_ID"
              when AS::PatchFilterKey::Section        then "SECTION"
              when AS::PatchFilterKey::Priority       then "PRIORITY"
              when AS::PatchFilterKey::Repository     then "REPOSITORY"
              when AS::PatchFilterKey::Release        then "RELEASE"
              when AS::PatchFilterKey::Severity       then "SEVERITY"
              when AS::PatchFilterKey::Security       then "SECURITY"
              when AS::PatchFilterKey::Version        then "VERSION"
              else
                raise Exception.new("unknown enum value for 'PatchFilterKey' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchFilterKey
      value = pull.read_string
      case value
      when "ARCH"           then AS::PatchFilterKey::Arch
      when "ADVISORY_ID"    then AS::PatchFilterKey::AdvisoryId
      when "BUGZILLA_ID"    then AS::PatchFilterKey::BugzillaId
      when "PATCH_SET"      then AS::PatchFilterKey::PatchSet
      when "PRODUCT"        then AS::PatchFilterKey::Product
      when "PRODUCT_FAMILY" then AS::PatchFilterKey::ProductFamily
      when "CLASSIFICATION" then AS::PatchFilterKey::Classification
      when "CVE_ID"         then AS::PatchFilterKey::CveId
      when "EPOCH"          then AS::PatchFilterKey::Epoch
      when "MSRC_SEVERITY"  then AS::PatchFilterKey::MsrcSeverity
      when "NAME"           then AS::PatchFilterKey::Name
      when "PATCH_ID"       then AS::PatchFilterKey::PatchId
      when "SECTION"        then AS::PatchFilterKey::Section
      when "PRIORITY"       then AS::PatchFilterKey::Priority
      when "REPOSITORY"     then AS::PatchFilterKey::Repository
      when "RELEASE"        then AS::PatchFilterKey::Release
      when "SEVERITY"       then AS::PatchFilterKey::Severity
      when "SECURITY"       then AS::PatchFilterKey::Security
      when "VERSION"        then AS::PatchFilterKey::Version
      else
        raise Exception.new("unknown enum value for 'PatchFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
