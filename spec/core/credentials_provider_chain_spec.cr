require "../spec_helper"

private alias CredentialsProviderChain = Amazonite::Core::CredentialsProviderChain
private alias CredentialsProvider = Amazonite::Core::CredentialsProvider
private alias Credentials = Amazonite::Core::Credentials

private class NilProvider < CredentialsProvider
  def credentials : Credentials?
    nil
  end
end

private class StaticProvider < CredentialsProvider
  def initialize(@creds : Credentials)
  end

  def credentials : Credentials?
    @creds
  end
end

describe CredentialsProviderChain do
  it "returns nil when every provider returns nil" do
    chain = CredentialsProviderChain.new([NilProvider.new, NilProvider.new] of CredentialsProvider)
    chain.credentials.should be_nil
  end

  it "returns the first non-nil provider's credentials" do
    creds = Credentials.new("key", "secret")
    chain = CredentialsProviderChain.new([NilProvider.new, StaticProvider.new(creds)] of CredentialsProvider)
    chain.credentials.should eq(creds)
  end

  it "does not consult providers after the first match" do
    creds = Credentials.new("key", "secret")
    never_called = StaticProvider.new(Credentials.new("other-key", "other-secret"))
    chain = CredentialsProviderChain.new([StaticProvider.new(creds), never_called] of CredentialsProvider)
    chain.credentials.should eq(creds)
  end
end
