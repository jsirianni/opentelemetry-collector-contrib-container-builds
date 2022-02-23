describe user('otel') do
    it { should exist }
    its('uid') { should eq 10001 }
    its('group') { should eq 'otel' }
    its('lastlogin') { should eq nil }
end

describe file('/otelcontribcol') do
    its('mode') { should cmp '0700' }
    its('owner') { should eq 'otel' }
    its('group') { should eq 'otel' }
    its('type') { should cmp 'file' }
end

describe port(8888) do
    it { should be_listening }
    its('processes') {should include 'otelcontribcol'}
end