private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about the patches to use to update the managed nodes, including target operating
  # systems and source repository. Applies to Linux managed nodes only.
  class PatchSource
    include JSON::Serializable

    # The name specified to identify the patch source.
    @[JSON::Field(key: "Name")]
    property name : String

    # The specific operating system versions a patch repository applies to, such as "Ubuntu16.04",
    # "AmazonLinux2016.09", "RedhatEnterpriseLinux7.2" or "Suse12.7". For lists of supported product
    # values, see PatchFilter.
    @[JSON::Field(key: "Products")]
    property products : Array(String) = [] of String

    # The value of the repo configuration.
    #
    # **Example for yum repositories**
    #
    # `[main]`
    #
    # `name=MyCustomRepository`
    #
    # `baseurl=https://my-custom-repository`
    #
    # `enabled=1`
    #
    # For information about other options available for your yum repository configuration, see
    # [dnf.conf(5)](https://man7.org/linux/man-pages/man5/dnf.conf.5.html) on the *man7.org* website.
    #
    # **Examples for Ubuntu Server and Debian Server**
    #
    # `deb http://security.ubuntu.com/ubuntu jammy main`
    #
    # `deb https://site.example.com/debian distribution component1 component2 component3`
    #
    # Repo information for Ubuntu Server repositories must be specifed in a single line. For more
    # examples and information, see [jammy (5)
    # sources.list.5.gz](https://manpages.ubuntu.com/manpages/jammy/man5/sources.list.5.html) on the
    # *Ubuntu Server Manuals* website and [sources.list
    # format](https://wiki.debian.org/SourcesList#sources.list_format) on the *Debian Wiki*.
    @[JSON::Field(key: "Configuration")]
    property configuration : String

    def initialize(
      @name : String,
      @products : Array(String),
      @configuration : String,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,50}$"))
      end

      if value = @products
        raise Core::ValidationError.new("Products must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Products must have at most 20 item(s)") if value.size > 20
      end

      if value = @configuration
        raise Core::ValidationError.new("Configuration length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Configuration length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@name, @products, @configuration)
  end
end
