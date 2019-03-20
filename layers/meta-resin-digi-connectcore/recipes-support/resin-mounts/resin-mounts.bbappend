FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append_ccimx6ul = " \
    file://ubifs.rules \
    file://resin-ubifs-partition-prepare \
    file://resin-state-init.service \
    file://resin-data-init.service \
"

SYSTEMD_SERVICE_${PN}_append_ccimx6ul = " \
    resin-state-init.service \
    resin-data-init.service \
"

RDEPENDS_${PN}_append_ccimx6ul = " mtd-utils-ubifs"

do_install_append_ccimx6ul () {
    install -d ${D}/lib/udev/rules.d
    install -m 0666 ${WORKDIR}/ubifs.rules ${D}/lib/udev/rules.d/60-persistent-storage-ubifs.rules
    install -m 755 ${WORKDIR}/resin-ubifs-partition-prepare ${D}${bindir}
    install -d ${D}${systemd_unitdir}/system
    install -c -m 0644 ${WORKDIR}/resin-state-init.service ${D}${systemd_unitdir}/system
    install -c -m 0644 ${WORKDIR}/resin-data-init.service ${D}${systemd_unitdir}/system
}

FILES_${PN}_append_ccimx6ul = " \
    resin-ubifs-partition-prepare \
"

#######

BINDMOUNTS_remove_ccimx6ul = " \
        /etc/udev/rules.d \
"
