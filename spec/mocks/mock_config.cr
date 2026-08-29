# TODO: should be using interfaces
class MockConfig < Amazonite::Core::Config
  protected def api_version
    "0.1.1"
  end

  protected def crystal_version
    "1.5.0"
  end

  protected def crystal_build_commit
    "41573fadc"
  end

  protected def crystal_llvm_version
    "13.0.2"
  end

  protected def crystal_description
    "Crystal 1.6.0 [41573fadb] (2022-10-06)\n\nLLVM: 13.0.1\nDefault target: arm_64-unknown-linux-gnu"
  end

  protected def create_ini_parser(profile, env : Amazonite::Core::Fetcher) : Amazonite::Core::IniParser
    test_credential_filepath = MockIniParser.test_credential_filepath
    test_config_filepath = MockIniParser.test_config_filepath
    MockIniParser.new(profile, env, test_credential_filepath, test_config_filepath)
  end

  protected def build_provider_chain : Amazonite::Core::CredentialsProviderChain
    Amazonite::Core::CredentialsProviderChain.new([
      Amazonite::Core::AssumeRoleCredentialsProvider.new(@ini_parser, @env),
      Amazonite::Core::SsoCredentialsProvider.new(@ini_parser, @env, MockIniParser.test_sso_cache_dir),
      Amazonite::Core::ContainerCredentialsProvider.new(@env),
      Amazonite::Core::InstanceMetadataCredentialsProvider.new(@env),
    ] of Amazonite::Core::CredentialsProvider)
  end
end
