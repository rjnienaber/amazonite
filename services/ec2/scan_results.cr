private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Amazon Inspector scan results for an AMI. This information is present only for AMIs that
  # Amazon Inspector has scanned.
  #
  # When you share an AMI with other accounts, organizations, or organizational units (OUs), or make
  # it public, its scan results are available to the accounts that can use the AMI.
  #
  # The fix-available dates are specific to the AMI. Each date reflects when a fix became available
  # for a finding on that AMI, not when the vendor released the fix. As a result, a date can be
  # later than the vendor's release date, and AMIs with the same vulnerability can have different
  # dates.
  class ScanResults
    # The highest severity among the AMI's Amazon Inspector findings, whether or not a fix is
    # available.
    #
    # The valid values are the following Amazon Inspector severity levels, which correspond to CVSS
    # score ranges:
    #
    # - `informational` - CVSS score of 0.
    #
    # - `low` - CVSS score of 0.1 to 3.9.
    #
    # - `medium` - CVSS score of 4.0 to 6.9.
    #
    # - `high` - CVSS score of 7.0 to 8.9.
    #
    # - `critical` - CVSS score of 9.0 to 10.0.
    #
    # For more information, see [Software package vulnerability
    # severity](https://docs.aws.amazon.com/inspector/latest/user/findings-understanding-severity.html#findings-understanding-package-score)
    # in the *Amazon Inspector User Guide*.
    #
    # This value is present only if the AMI has at least one finding.
    property highest_finding_severity_label : SeverityLabel | Nil

    # The date and time, in the ISO 8601 format in the UTC time zone (YYYY-MM-DDThh:mm:ss.sssZ), of
    # the most recent Amazon Inspector scan of the AMI.
    property finding_scan_date : Time | Nil

    # The earliest date and time, in the ISO 8601 format in the UTC time zone
    # (YYYY-MM-DDThh:mm:ss.sssZ), at which Amazon Inspector reported a fix as available for an
    # `informational` severity finding on the AMI. This value is present only if the AMI has at least
    # one `informational` severity finding with a fix available. Amazon Inspector recomputes this
    # value on each scan.
    property informational_fix_available_since : Time | Nil

    # The earliest date and time, in the ISO 8601 format in the UTC time zone
    # (YYYY-MM-DDThh:mm:ss.sssZ), at which Amazon Inspector reported a fix as available for a `low`
    # severity finding on the AMI. This value is present only if the AMI has at least one `low`
    # severity finding with a fix available. Amazon Inspector recomputes this value on each scan.
    property low_fix_available_since : Time | Nil

    # The earliest date and time, in the ISO 8601 format in the UTC time zone
    # (YYYY-MM-DDThh:mm:ss.sssZ), at which Amazon Inspector reported a fix as available for a `medium`
    # severity finding on the AMI. This value is present only if the AMI has at least one `medium`
    # severity finding with a fix available. Amazon Inspector recomputes this value on each scan.
    property medium_fix_available_since : Time | Nil

    # The earliest date and time, in the ISO 8601 format in the UTC time zone
    # (YYYY-MM-DDThh:mm:ss.sssZ), at which Amazon Inspector reported a fix as available for a `high`
    # severity finding on the AMI. This value is present only if the AMI has at least one `high`
    # severity finding with a fix available. Amazon Inspector recomputes this value on each scan.
    property high_fix_available_since : Time | Nil

    # The earliest date and time, in the ISO 8601 format in the UTC time zone
    # (YYYY-MM-DDThh:mm:ss.sssZ), at which Amazon Inspector reported a fix as available for a
    # `critical` severity finding on the AMI. This value is present only if the AMI has at least one
    # `critical` severity finding with a fix available. Amazon Inspector recomputes this value on each
    # scan.
    property critical_fix_available_since : Time | Nil

    def initialize(
      @highest_finding_severity_label : SeverityLabel | Nil = nil,
      @finding_scan_date : Time | Nil = nil,
      @informational_fix_available_since : Time | Nil = nil,
      @low_fix_available_since : Time | Nil = nil,
      @medium_fix_available_since : Time | Nil = nil,
      @high_fix_available_since : Time | Nil = nil,
      @critical_fix_available_since : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @highest_finding_severity_label
        params << {"#{prefix}HighestFindingSeverityLabel", value.to_json_object_key}
      end

      if value = @finding_scan_date
        params << {"#{prefix}FindingScanDate", Core::QueryValue.time(value)}
      end

      if value = @informational_fix_available_since
        params << {"#{prefix}InformationalFixAvailableSince", Core::QueryValue.time(value)}
      end

      if value = @low_fix_available_since
        params << {"#{prefix}LowFixAvailableSince", Core::QueryValue.time(value)}
      end

      if value = @medium_fix_available_since
        params << {"#{prefix}MediumFixAvailableSince", Core::QueryValue.time(value)}
      end

      if value = @high_fix_available_since
        params << {"#{prefix}HighFixAvailableSince", Core::QueryValue.time(value)}
      end

      if value = @critical_fix_available_since
        params << {"#{prefix}CriticalFixAvailableSince", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        highest_finding_severity_label: (n = node.xpath_node("*[local-name()='highestFindingSeverityLabel']")) ? AEC::SeverityLabel.from_json_object_key?(n.content) : nil,
        finding_scan_date: Core::XMLValue.time(node.xpath_node("*[local-name()='findingScanDate']")),
        informational_fix_available_since: Core::XMLValue.time(node.xpath_node("*[local-name()='informationalFixAvailableSince']")),
        low_fix_available_since: Core::XMLValue.time(node.xpath_node("*[local-name()='lowFixAvailableSince']")),
        medium_fix_available_since: Core::XMLValue.time(node.xpath_node("*[local-name()='mediumFixAvailableSince']")),
        high_fix_available_since: Core::XMLValue.time(node.xpath_node("*[local-name()='highFixAvailableSince']")),
        critical_fix_available_since: Core::XMLValue.time(node.xpath_node("*[local-name()='criticalFixAvailableSince']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@highest_finding_severity_label, @finding_scan_date, @informational_fix_available_since, @low_fix_available_since, @medium_fix_available_since, @high_fix_available_since, @critical_fix_available_since)
  end
end
