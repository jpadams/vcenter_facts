Facter.add('vcenter_code') do
  setcode do
    mac = Facter.value(:macaddress)
    vc_code = (mac.split(":")[3].hex - 0x80).to_s(16)
    vc_code
  end
end

Facter.add('vcenter_name') do
  setcode do
    vc_name = {
      "1c"=>"vc1",
      "4f"=>"vc2",
      "5b"=>"vc3"
    }
    vc_code = Facter.value(:vc_code)
    vc_name[vc_code]
  end
end
