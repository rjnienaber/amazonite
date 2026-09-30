private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Defines which patches should be included in a patch baseline.
  #
  # A patch filter consists of a key and a set of values. The filter key is a patch property. For
  # example, the available filter keys for `WINDOWS` are `PATCH_SET`, `PRODUCT`, `PRODUCT_FAMILY`,
  # `CLASSIFICATION`, and `MSRC_SEVERITY`.
  #
  # The filter values define a matching criterion for the patch property indicated by the key. For
  # example, if the filter key is `PRODUCT` and the filter values are `["Office 2013", "Office
  # 2016"]`, then the filter accepts all patches where product name is either "Office 2013" or
  # "Office 2016". The filter values can be exact values for the patch property given as a key, or a
  # wildcard (*), which matches all values.
  #
  # You can view lists of valid values for the patch properties by running the
  # `DescribePatchProperties` command. For information about which patch properties can be used with
  # each major operating system, see DescribePatchProperties.
  class PatchFilter
    include JSON::Serializable

    # The key for the filter.
    #
    # Run the DescribePatchProperties command to view lists of valid keys for each operating system
    # type.
    @[JSON::Field(key: "Key", converter: AS::PatchFilterKey)]
    property key : PatchFilterKey

    # The value for the filter key.
    #
    # Run the DescribePatchProperties command to view lists of valid values for each key based on
    # operating system type.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    def initialize(
      @key : PatchFilterKey,
      @values : Array(String),
    )
    end

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
