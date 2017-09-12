use Mix.Config

config :farmbot, data_path: "/state"

# Configure your our system.
# Default implementation needs no special stuff.
config :farmbot, :init, [
  # initialize the configuration.
  # This bring up a captive portal if needed.
  Farmbot.Bootstrap.Configurator,

  # Start up Network
  Farmbot.System.Network
]

# Transports.
config :farmbot, :transport, [
  Farmbot.BotState.Transport.GenMqtt
]


# Configure Farmbot Behaviours.
config :farmbot, :behaviour, [
  authorization: Farmbot.Bootstrap.Authorization,
  system_tasks: Farmbot.Target.SystemTasks
]

config :nerves_firmware_ssh,
  authorized_keys: [
    File.read!(Path.join(System.user_home!, ".ssh/id_rsa.pub"))
  ]

config :bootloader,
  init: [:nerves_runtime, :nerves_init_gadget],
  app: :farmbot
