class PropertyMailer < ApplicationMailer
  def create_confirmation(property)
    @property = property

    mail(
      to:       @property.user.email,
      subject:  "Propiedad #{@property.reference} creada!"
    )
  end
end
