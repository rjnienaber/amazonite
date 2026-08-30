private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Represents metadata about a patch.
  class Patch
    include JSON::Serializable

    # The ID of the patch. Applies to Windows patches only.
    #
    # This ID isn't the same as the Microsoft Knowledge Base ID.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # The date the patch was released.
    @[JSON::Field(key: "ReleaseDate", converter: Core::AWSEpochConverter)]
    property release_date : Time | Nil

    # The title of the patch.
    @[JSON::Field(key: "Title")]
    property title : String | Nil

    # The description of the patch.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The URL where more information can be obtained about the patch.
    @[JSON::Field(key: "ContentUrl")]
    property content_url : String | Nil

    # The name of the vendor providing the patch.
    @[JSON::Field(key: "Vendor")]
    property vendor : String | Nil

    # The product family the patch is applicable for. For example, `Windows` or `Amazon Linux 2`.
    @[JSON::Field(key: "ProductFamily")]
    property product_family : String | Nil

    # The specific product the patch is applicable for. For example, `WindowsServer2016` or
    # `AmazonLinux2018.03`.
    @[JSON::Field(key: "Product")]
    property product : String | Nil

    # The classification of the patch. For example, `SecurityUpdates`, `Updates`, or
    # `CriticalUpdates`.
    @[JSON::Field(key: "Classification")]
    property classification : String | Nil

    # The severity of the patch, such as `Critical`, `Important`, or `Moderate`. Applies to Windows
    # patches only.
    @[JSON::Field(key: "MsrcSeverity")]
    property msrc_severity : String | Nil

    # The Microsoft Knowledge Base ID of the patch. Applies to Windows patches only.
    @[JSON::Field(key: "KbNumber")]
    property kb_number : String | Nil

    # The ID of the Microsoft Security Response Center (MSRC) bulletin the patch is related to. For
    # example, `MS14-045`. Applies to Windows patches only.
    @[JSON::Field(key: "MsrcNumber")]
    property msrc_number : String | Nil

    # The language of the patch if it's language-specific.
    @[JSON::Field(key: "Language")]
    property language : String | Nil

    # The Advisory ID of the patch. For example, `RHSA-2020:3779`. Applies to Linux-based managed
    # nodes only.
    @[JSON::Field(key: "AdvisoryIds")]
    property advisory_ids : Array(String) | Nil

    # The Bugzilla ID of the patch. For example, `1600646`. Applies to Linux-based managed nodes only.
    @[JSON::Field(key: "BugzillaIds")]
    property bugzilla_ids : Array(String) | Nil

    # The Common Vulnerabilities and Exposures (CVE) ID of the patch. For example, `CVE-2011-3192`.
    # Applies to Linux-based managed nodes only.
    @[JSON::Field(key: "CVEIds")]
    property cve_ids : Array(String) | Nil

    # The name of the patch. Applies to Linux-based managed nodes only.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The epoch of the patch. For example in `pkg-example-EE-20180914-2.2.amzn1.noarch`, the epoch
    # value is `20180914-2`. Applies to Linux-based managed nodes only.
    @[JSON::Field(key: "Epoch")]
    property epoch : Int32 | Nil

    # The version number of the patch. For example, in `example-pkg-1.710.10-2.7.abcd.x86_64`, the
    # version number is indicated by `-1`. Applies to Linux-based managed nodes only.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # The particular release of a patch. For example, in `pkg-example-EE-20180914-2.2.amzn1.noarch`,
    # the release is `2.amaz1`. Applies to Linux-based managed nodes only.
    @[JSON::Field(key: "Release")]
    property release : String | Nil

    # The architecture of the patch. For example, in `example-pkg-0.710.10-2.7.abcd.x86_64`, the
    # architecture is indicated by `x86_64`. Applies to Linux-based managed nodes only.
    @[JSON::Field(key: "Arch")]
    property arch : String | Nil

    # The severity level of the patch. For example, `CRITICAL` or `MODERATE`.
    @[JSON::Field(key: "Severity")]
    property severity : String | Nil

    # The source patch repository for the operating system and version, such as `trusty-security` for
    # Ubuntu Server 14.04 LTE and `focal-security` for Ubuntu Server 20.04 LTE. Applies to Linux-based
    # managed nodes only.
    @[JSON::Field(key: "Repository")]
    property repository : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @release_date : Time | Nil = nil,
      @title : String | Nil = nil,
      @description : String | Nil = nil,
      @content_url : String | Nil = nil,
      @vendor : String | Nil = nil,
      @product_family : String | Nil = nil,
      @product : String | Nil = nil,
      @classification : String | Nil = nil,
      @msrc_severity : String | Nil = nil,
      @kb_number : String | Nil = nil,
      @msrc_number : String | Nil = nil,
      @language : String | Nil = nil,
      @advisory_ids : Array(String) | Nil = nil,
      @bugzilla_ids : Array(String) | Nil = nil,
      @cve_ids : Array(String) | Nil = nil,
      @name : String | Nil = nil,
      @epoch : Int32 | Nil = nil,
      @version : String | Nil = nil,
      @release : String | Nil = nil,
      @arch : String | Nil = nil,
      @severity : String | Nil = nil,
      @repository : String | Nil = nil,
    )
    end

    def_equals_and_hash(@id, @release_date, @title, @description, @content_url, @vendor, @product_family, @product, @classification, @msrc_severity, @kb_number, @msrc_number, @language, @advisory_ids, @bugzilla_ids, @cve_ids, @name, @epoch, @version, @release, @arch, @severity, @repository)
  end
end
