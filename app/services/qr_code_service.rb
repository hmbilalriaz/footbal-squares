class QrCodeService
  def initialize(resource_url)
    @resource_url = resource_url
  end

  def generate_qr
    RQRCode::QRCode.new(@resource_url)
  end
end