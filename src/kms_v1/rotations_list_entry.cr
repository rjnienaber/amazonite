private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Each entry contains information about one of the key materials associated with a KMS key.
  class RotationsListEntry
    include JSON::Serializable

    # Unique identifier of the key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # Unique identifier of the key material.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    # User-specified description of the key material. This field is only present for symmetric
    # encryption KMS keys with `EXTERNAL` origin.
    @[JSON::Field(key: "KeyMaterialDescription")]
    property key_material_description : String | Nil

    # Indicates if the key material is currently imported into KMS. It has two possible values:
    # `IMPORTED` or `PENDING_IMPORT`. This field is only present for symmetric encryption KMS keys
    # with `EXTERNAL` origin.
    @[JSON::Field(key: "ImportState", converter: AK::ImportState)]
    property import_state : ImportState | Nil

    # There are four possible values for this field: `CURRENT`, `NON_CURRENT`,
    # `PENDING_MULTI_REGION_IMPORT_AND_ROTATION` and `PENDING_ROTATION`. KMS uses `CURRENT` key
    # material for both encryption and decryption and `NON_CURRENT` key material only for decryption.
    # `PENDING_ROTATION` identifies key material that has been imported for on-demand key rotation but
    # the rotation hasn't completed. The key material state `PENDING_MULTI_REGION_IMPORT_AND_ROTATION`
    # is unique to multi-region, symmetric encryption keys with imported key material. It indicates
    # key material that has been imported into the primary Region key but not all of the replica
    # Region keys. When this key material is imported in to all of the replica Region keys, the key
    # material state will change to `PENDING_ROTATION`. Key material in
    # `PENDING_MULTI_REGION_IMPORT_AND_ROTATION` or `PENDING_ROTATION` state is not permanently
    # associated with the KMS key. You can delete this key material and import different key material
    # in its place. The `PENDING_MULTI_REGION_IMPORT_AND_ROTATION` and `PENDING_ROTATION` values are
    # only used in symmetric encryption keys with imported key material. The other values, `CURRENT`
    # and `NON_CURRENT`, are used for all KMS keys that support automatic or on-demand key rotation.
    @[JSON::Field(key: "KeyMaterialState", converter: AK::KeyMaterialState)]
    property key_material_state : KeyMaterialState | Nil

    # Indicates if the key material is configured to automatically expire. There are two possible
    # values for this field: `KEY_MATERIAL_EXPIRES` and `KEY_MATERIAL_DOES_NOT_EXPIRE`. For any key
    # material that expires, the expiration date and time is indicated in `ValidTo`. This field is
    # only present for symmetric encryption KMS keys with `EXTERNAL` origin.
    @[JSON::Field(key: "ExpirationModel", converter: AK::ExpirationModelType)]
    property expiration_model : ExpirationModelType | Nil

    # Date and time at which the key material expires. This field is only present for symmetric
    # encryption KMS keys with `EXTERNAL` origin in rotation list entries with an `ExpirationModel`
    # value of `KEY_MATERIAL_EXPIRES`.
    @[JSON::Field(key: "ValidTo", converter: Core::AWSEpochConverter)]
    property valid_to : Time | Nil

    # Date and time that the key material rotation completed. Formatted as Unix time. This field is
    # not present for the first key material or an imported key material in `PENDING_ROTATION` state.
    @[JSON::Field(key: "RotationDate", converter: Core::AWSEpochConverter)]
    property rotation_date : Time | Nil

    # Identifies whether the key material rotation was a scheduled [automatic
    # rotation](https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-enable-disable.html)
    # or an [on-demand
    # rotation](https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-on-demand.html).
    # This field is not present for the first key material or an imported key material in
    # `PENDING_ROTATION` state.
    @[JSON::Field(key: "RotationType", converter: AK::RotationType)]
    property rotation_type : RotationType | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_material_id : String | Nil = nil,
      @key_material_description : String | Nil = nil,
      @import_state : ImportState | Nil = nil,
      @key_material_state : KeyMaterialState | Nil = nil,
      @expiration_model : ExpirationModelType | Nil = nil,
      @valid_to : Time | Nil = nil,
      @rotation_date : Time | Nil = nil,
      @rotation_type : RotationType | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @key_material_id, @key_material_description, @import_state, @key_material_state, @expiration_model, @valid_to, @rotation_date, @rotation_type)
  end
end
