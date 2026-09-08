private alias AS = Amazonite::S3

module Amazonite::S3
  enum StorageClass
    Standard
    ReducedRedundancy
    StandardIa
    OnezoneIa
    IntelligentTiering
    Glacier
    DeepArchive
    Outposts
    GlacierIr
    Snow
    ExpressOnezone
    FsxOpenzfs
    FsxOntap
    AwsBackupWarm
    AwsBackupLowCostWarm

    def self.to_json(e : StorageClass, json : JSON::Builder) : Nil
      value = case e
              when AS::StorageClass::Standard             then "STANDARD"
              when AS::StorageClass::ReducedRedundancy    then "REDUCED_REDUNDANCY"
              when AS::StorageClass::StandardIa           then "STANDARD_IA"
              when AS::StorageClass::OnezoneIa            then "ONEZONE_IA"
              when AS::StorageClass::IntelligentTiering   then "INTELLIGENT_TIERING"
              when AS::StorageClass::Glacier              then "GLACIER"
              when AS::StorageClass::DeepArchive          then "DEEP_ARCHIVE"
              when AS::StorageClass::Outposts             then "OUTPOSTS"
              when AS::StorageClass::GlacierIr            then "GLACIER_IR"
              when AS::StorageClass::Snow                 then "SNOW"
              when AS::StorageClass::ExpressOnezone       then "EXPRESS_ONEZONE"
              when AS::StorageClass::FsxOpenzfs           then "FSX_OPENZFS"
              when AS::StorageClass::FsxOntap             then "FSX_ONTAP"
              when AS::StorageClass::AwsBackupWarm        then "AWS_BACKUP_WARM"
              when AS::StorageClass::AwsBackupLowCostWarm then "AWS_BACKUP_LOW_COST_WARM"
              else
                raise Exception.new("unknown enum value for 'StorageClass' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::StorageClass
      value = pull.read_string
      case value
      when "STANDARD"                 then AS::StorageClass::Standard
      when "REDUCED_REDUNDANCY"       then AS::StorageClass::ReducedRedundancy
      when "STANDARD_IA"              then AS::StorageClass::StandardIa
      when "ONEZONE_IA"               then AS::StorageClass::OnezoneIa
      when "INTELLIGENT_TIERING"      then AS::StorageClass::IntelligentTiering
      when "GLACIER"                  then AS::StorageClass::Glacier
      when "DEEP_ARCHIVE"             then AS::StorageClass::DeepArchive
      when "OUTPOSTS"                 then AS::StorageClass::Outposts
      when "GLACIER_IR"               then AS::StorageClass::GlacierIr
      when "SNOW"                     then AS::StorageClass::Snow
      when "EXPRESS_ONEZONE"          then AS::StorageClass::ExpressOnezone
      when "FSX_OPENZFS"              then AS::StorageClass::FsxOpenzfs
      when "FSX_ONTAP"                then AS::StorageClass::FsxOntap
      when "AWS_BACKUP_WARM"          then AS::StorageClass::AwsBackupWarm
      when "AWS_BACKUP_LOW_COST_WARM" then AS::StorageClass::AwsBackupLowCostWarm
      else
        raise Exception.new("unknown enum value for 'StorageClass' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::StorageClass::Standard             then "STANDARD"
      when AS::StorageClass::ReducedRedundancy    then "REDUCED_REDUNDANCY"
      when AS::StorageClass::StandardIa           then "STANDARD_IA"
      when AS::StorageClass::OnezoneIa            then "ONEZONE_IA"
      when AS::StorageClass::IntelligentTiering   then "INTELLIGENT_TIERING"
      when AS::StorageClass::Glacier              then "GLACIER"
      when AS::StorageClass::DeepArchive          then "DEEP_ARCHIVE"
      when AS::StorageClass::Outposts             then "OUTPOSTS"
      when AS::StorageClass::GlacierIr            then "GLACIER_IR"
      when AS::StorageClass::Snow                 then "SNOW"
      when AS::StorageClass::ExpressOnezone       then "EXPRESS_ONEZONE"
      when AS::StorageClass::FsxOpenzfs           then "FSX_OPENZFS"
      when AS::StorageClass::FsxOntap             then "FSX_ONTAP"
      when AS::StorageClass::AwsBackupWarm        then "AWS_BACKUP_WARM"
      when AS::StorageClass::AwsBackupLowCostWarm then "AWS_BACKUP_LOW_COST_WARM"
      else
        raise Exception.new("unknown enum value for 'StorageClass' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::StorageClass?
      case key
      when "STANDARD"                 then AS::StorageClass::Standard
      when "REDUCED_REDUNDANCY"       then AS::StorageClass::ReducedRedundancy
      when "STANDARD_IA"              then AS::StorageClass::StandardIa
      when "ONEZONE_IA"               then AS::StorageClass::OnezoneIa
      when "INTELLIGENT_TIERING"      then AS::StorageClass::IntelligentTiering
      when "GLACIER"                  then AS::StorageClass::Glacier
      when "DEEP_ARCHIVE"             then AS::StorageClass::DeepArchive
      when "OUTPOSTS"                 then AS::StorageClass::Outposts
      when "GLACIER_IR"               then AS::StorageClass::GlacierIr
      when "SNOW"                     then AS::StorageClass::Snow
      when "EXPRESS_ONEZONE"          then AS::StorageClass::ExpressOnezone
      when "FSX_OPENZFS"              then AS::StorageClass::FsxOpenzfs
      when "FSX_ONTAP"                then AS::StorageClass::FsxOntap
      when "AWS_BACKUP_WARM"          then AS::StorageClass::AwsBackupWarm
      when "AWS_BACKUP_LOW_COST_WARM" then AS::StorageClass::AwsBackupLowCostWarm
      else
        nil
      end
    end
  end
end
