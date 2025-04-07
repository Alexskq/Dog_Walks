# Configuration pour SolidQueue
if Rails.env.production?
  Rails.application.config.solid_queue.connects_to = { database: { writing: :production_queue } }
end 