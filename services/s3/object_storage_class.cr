private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectStorageClass
    Standard
    ReducedRedundancy
    Glacier
    StandardIa
    OnezoneIa
    IntelligentTiering
    DeepArchive
    Outposts
    GlacierIr
    Snow
    ExpressOnezone
    FsxOpenzfs
    FsxOntap
    AwsBackupWarm
    AwsBackupLowCostWarm

    def self.to_json(e : ObjectStorageClass, json : JSON::Builder) : Nil
      value = case e
              when AS::ObjectStorageClass::Standard             then "STANDARD"
              when AS::ObjectStorageClass::ReducedRedundancy    then "REDUCED_REDUNDANCY"
              when AS::ObjectStorageClass::Glacier              then "GLACIER"
              when AS::ObjectStorageClass::StandardIa           then "STANDARD_IA"
              when AS::ObjectStorageClass::OnezoneIa            then "ONEZONE_IA"
              when AS::ObjectStorageClass::IntelligentTiering   then "INTELLIGENT_TIERING"
              when AS::ObjectStorageClass::DeepArchive          then "DEEP_ARCHIVE"
              when AS::ObjectStorageClass::Outposts             then "OUTPOSTS"
              when AS::ObjectStorageClass::GlacierIr            then "GLACIER_IR"
              when AS::ObjectStorageClass::Snow                 then "SNOW"
              when AS::ObjectStorageClass::ExpressOnezone       then "EXPRESS_ONEZONE"
              when AS::ObjectStorageClass::FsxOpenzfs           then "FSX_OPENZFS"
              when AS::ObjectStorageClass::FsxOntap             then "FSX_ONTAP"
              when AS::ObjectStorageClass::AwsBackupWarm        then "AWS_BACKUP_WARM"
              when AS::ObjectStorageClass::AwsBackupLowCostWarm then "AWS_BACKUP_LOW_COST_WARM"
              else
                raise Exception.new("unknown enum value for 'ObjectStorageClass' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectStorageClass
      value = pull.read_string
      case value
      when "STANDARD"                 then AS::ObjectStorageClass::Standard
      when "REDUCED_REDUNDANCY"       then AS::ObjectStorageClass::ReducedRedundancy
      when "GLACIER"                  then AS::ObjectStorageClass::Glacier
      when "STANDARD_IA"              then AS::ObjectStorageClass::StandardIa
      when "ONEZONE_IA"               then AS::ObjectStorageClass::OnezoneIa
      when "INTELLIGENT_TIERING"      then AS::ObjectStorageClass::IntelligentTiering
      when "DEEP_ARCHIVE"             then AS::ObjectStorageClass::DeepArchive
      when "OUTPOSTS"                 then AS::ObjectStorageClass::Outposts
      when "GLACIER_IR"               then AS::ObjectStorageClass::GlacierIr
      when "SNOW"                     then AS::ObjectStorageClass::Snow
      when "EXPRESS_ONEZONE"          then AS::ObjectStorageClass::ExpressOnezone
      when "FSX_OPENZFS"              then AS::ObjectStorageClass::FsxOpenzfs
      when "FSX_ONTAP"                then AS::ObjectStorageClass::FsxOntap
      when "AWS_BACKUP_WARM"          then AS::ObjectStorageClass::AwsBackupWarm
      when "AWS_BACKUP_LOW_COST_WARM" then AS::ObjectStorageClass::AwsBackupLowCostWarm
      else
        raise Exception.new("unknown enum value for 'ObjectStorageClass' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ObjectStorageClass::Standard             then "STANDARD"
      when AS::ObjectStorageClass::ReducedRedundancy    then "REDUCED_REDUNDANCY"
      when AS::ObjectStorageClass::Glacier              then "GLACIER"
      when AS::ObjectStorageClass::StandardIa           then "STANDARD_IA"
      when AS::ObjectStorageClass::OnezoneIa            then "ONEZONE_IA"
      when AS::ObjectStorageClass::IntelligentTiering   then "INTELLIGENT_TIERING"
      when AS::ObjectStorageClass::DeepArchive          then "DEEP_ARCHIVE"
      when AS::ObjectStorageClass::Outposts             then "OUTPOSTS"
      when AS::ObjectStorageClass::GlacierIr            then "GLACIER_IR"
      when AS::ObjectStorageClass::Snow                 then "SNOW"
      when AS::ObjectStorageClass::ExpressOnezone       then "EXPRESS_ONEZONE"
      when AS::ObjectStorageClass::FsxOpenzfs           then "FSX_OPENZFS"
      when AS::ObjectStorageClass::FsxOntap             then "FSX_ONTAP"
      when AS::ObjectStorageClass::AwsBackupWarm        then "AWS_BACKUP_WARM"
      when AS::ObjectStorageClass::AwsBackupLowCostWarm then "AWS_BACKUP_LOW_COST_WARM"
      else
        raise Exception.new("unknown enum value for 'ObjectStorageClass' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ObjectStorageClass?
      case key
      when "STANDARD"                 then AS::ObjectStorageClass::Standard
      when "REDUCED_REDUNDANCY"       then AS::ObjectStorageClass::ReducedRedundancy
      when "GLACIER"                  then AS::ObjectStorageClass::Glacier
      when "STANDARD_IA"              then AS::ObjectStorageClass::StandardIa
      when "ONEZONE_IA"               then AS::ObjectStorageClass::OnezoneIa
      when "INTELLIGENT_TIERING"      then AS::ObjectStorageClass::IntelligentTiering
      when "DEEP_ARCHIVE"             then AS::ObjectStorageClass::DeepArchive
      when "OUTPOSTS"                 then AS::ObjectStorageClass::Outposts
      when "GLACIER_IR"               then AS::ObjectStorageClass::GlacierIr
      when "SNOW"                     then AS::ObjectStorageClass::Snow
      when "EXPRESS_ONEZONE"          then AS::ObjectStorageClass::ExpressOnezone
      when "FSX_OPENZFS"              then AS::ObjectStorageClass::FsxOpenzfs
      when "FSX_ONTAP"                then AS::ObjectStorageClass::FsxOntap
      when "AWS_BACKUP_WARM"          then AS::ObjectStorageClass::AwsBackupWarm
      when "AWS_BACKUP_LOW_COST_WARM" then AS::ObjectStorageClass::AwsBackupLowCostWarm
      else
        nil
      end
    end
  end
end
