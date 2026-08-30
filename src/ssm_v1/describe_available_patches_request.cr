module Amazonite::SsmV1
  class DescribeAvailablePatchesRequest
    include JSON::Serializable

    # Each element in the array is a structure containing a key-value pair.
    #
    # **Windows Server**
    #
    # Supported keys for Windows Server managed node patches include the following:
    #
    # - ** `PATCH_SET` **
    #
    # Sample values: `OS` | `APPLICATION`
    #
    # - ** `PRODUCT` **
    #
    # Sample values: `WindowsServer2012` | `Office 2010` | `MicrosoftDefenderAntivirus`
    #
    # - ** `PRODUCT_FAMILY` **
    #
    # Sample values: `Windows` | `Office`
    #
    # - ** `MSRC_SEVERITY` **
    #
    # Sample values: `ServicePacks` | `Important` | `Moderate`
    #
    # - ** `CLASSIFICATION` **
    #
    # Sample values: `ServicePacks` | `SecurityUpdates` | `DefinitionUpdates`
    #
    # - ** `PATCH_ID` **
    #
    # Sample values: `KB123456` | `KB4516046`
    #
    # **Linux**
    #
    # When specifying filters for Linux patches, you must specify a key-pair for `PRODUCT`. For
    # example, using the Command Line Interface (CLI), the following command fails:
    #
    # `aws ssm describe-available-patches --filters Key=CVE_ID,Values=CVE-2018-3615`
    #
    # However, the following command succeeds:
    #
    # `aws ssm describe-available-patches --filters Key=PRODUCT,Values=AmazonLinux2018.03
    # Key=CVE_ID,Values=CVE-2018-3615`
    #
    # Supported keys for Linux managed node patches include the following:
    #
    # - ** `PRODUCT` **
    #
    # Sample values: `AmazonLinux2018.03` | `AmazonLinux2.0`
    #
    # - ** `NAME` **
    #
    # Sample values: `kernel-headers` | `samba-python` | `php`
    #
    # - ** `SEVERITY` **
    #
    # Sample values: `Critical` | `Important` | `Medium` | `Low`
    #
    # - ** `EPOCH` **
    #
    # Sample values: `0` | `1`
    #
    # - ** `VERSION` **
    #
    # Sample values: `78.6.1` | `4.10.16`
    #
    # - ** `RELEASE` **
    #
    # Sample values: `9.56.amzn1` | `1.amzn2`
    #
    # - ** `ARCH` **
    #
    # Sample values: `i686` | `x86_64`
    #
    # - ** `REPOSITORY` **
    #
    # Sample values: `Core` | `Updates`
    #
    # - ** `ADVISORY_ID` **
    #
    # Sample values: `ALAS-2018-1058` | `ALAS2-2021-1594`
    #
    # - ** `CVE_ID` **
    #
    # Sample values: `CVE-2018-3615` | `CVE-2020-1472`
    #
    # - ** `BUGZILLA_ID` **
    #
    # Sample values: `1463241`
    @[JSON::Field(key: "Filters")]
    property filters : Array(PatchOrchestratorFilter) | Nil

    # The maximum number of patches to return (per page).
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(PatchOrchestratorFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@filters, @max_results, @next_token)
  end
end
