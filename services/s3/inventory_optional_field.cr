private alias AS = Amazonite::S3

module Amazonite::S3
  enum InventoryOptionalField
    Size
    LastModifiedDate
    StorageClass
    ETag
    IsMultipartUploaded
    ReplicationStatus
    EncryptionStatus
    ObjectLockRetainUntilDate
    ObjectLockMode
    ObjectLockLegalHoldStatus
    ObjectLockEventHoldStatus
    ObjectLockEventHoldDuration
    IntelligentTieringAccessTier
    BucketKeyStatus
    ChecksumAlgorithm
    ObjectAccessControlList
    ObjectOwner
    LifecycleExpirationDate

    def self.to_json(e : InventoryOptionalField, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryOptionalField
      value = pull.read_string
      case value
      when "Size"                         then AS::InventoryOptionalField::Size
      when "LastModifiedDate"             then AS::InventoryOptionalField::LastModifiedDate
      when "StorageClass"                 then AS::InventoryOptionalField::StorageClass
      when "ETag"                         then AS::InventoryOptionalField::ETag
      when "IsMultipartUploaded"          then AS::InventoryOptionalField::IsMultipartUploaded
      when "ReplicationStatus"            then AS::InventoryOptionalField::ReplicationStatus
      when "EncryptionStatus"             then AS::InventoryOptionalField::EncryptionStatus
      when "ObjectLockRetainUntilDate"    then AS::InventoryOptionalField::ObjectLockRetainUntilDate
      when "ObjectLockMode"               then AS::InventoryOptionalField::ObjectLockMode
      when "ObjectLockLegalHoldStatus"    then AS::InventoryOptionalField::ObjectLockLegalHoldStatus
      when "ObjectLockEventHoldStatus"    then AS::InventoryOptionalField::ObjectLockEventHoldStatus
      when "ObjectLockEventHoldDuration"  then AS::InventoryOptionalField::ObjectLockEventHoldDuration
      when "IntelligentTieringAccessTier" then AS::InventoryOptionalField::IntelligentTieringAccessTier
      when "BucketKeyStatus"              then AS::InventoryOptionalField::BucketKeyStatus
      when "ChecksumAlgorithm"            then AS::InventoryOptionalField::ChecksumAlgorithm
      when "ObjectAccessControlList"      then AS::InventoryOptionalField::ObjectAccessControlList
      when "ObjectOwner"                  then AS::InventoryOptionalField::ObjectOwner
      when "LifecycleExpirationDate"      then AS::InventoryOptionalField::LifecycleExpirationDate
      else
        raise Exception.new("unknown enum value for 'InventoryOptionalField' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::InventoryOptionalField?
      case key
      when "Size"                         then AS::InventoryOptionalField::Size
      when "LastModifiedDate"             then AS::InventoryOptionalField::LastModifiedDate
      when "StorageClass"                 then AS::InventoryOptionalField::StorageClass
      when "ETag"                         then AS::InventoryOptionalField::ETag
      when "IsMultipartUploaded"          then AS::InventoryOptionalField::IsMultipartUploaded
      when "ReplicationStatus"            then AS::InventoryOptionalField::ReplicationStatus
      when "EncryptionStatus"             then AS::InventoryOptionalField::EncryptionStatus
      when "ObjectLockRetainUntilDate"    then AS::InventoryOptionalField::ObjectLockRetainUntilDate
      when "ObjectLockMode"               then AS::InventoryOptionalField::ObjectLockMode
      when "ObjectLockLegalHoldStatus"    then AS::InventoryOptionalField::ObjectLockLegalHoldStatus
      when "ObjectLockEventHoldStatus"    then AS::InventoryOptionalField::ObjectLockEventHoldStatus
      when "ObjectLockEventHoldDuration"  then AS::InventoryOptionalField::ObjectLockEventHoldDuration
      when "IntelligentTieringAccessTier" then AS::InventoryOptionalField::IntelligentTieringAccessTier
      when "BucketKeyStatus"              then AS::InventoryOptionalField::BucketKeyStatus
      when "ChecksumAlgorithm"            then AS::InventoryOptionalField::ChecksumAlgorithm
      when "ObjectAccessControlList"      then AS::InventoryOptionalField::ObjectAccessControlList
      when "ObjectOwner"                  then AS::InventoryOptionalField::ObjectOwner
      when "LifecycleExpirationDate"      then AS::InventoryOptionalField::LifecycleExpirationDate
      else
        nil
      end
    end
  end
end
