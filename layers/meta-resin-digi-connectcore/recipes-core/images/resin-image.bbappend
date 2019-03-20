IMAGE_FSTYPES_ccimx6ul = "tar.bz2 ubifs boot.ubifs"

DEPENDS_append_ccimx6ul = " mtd-utils-native"

resin_default_ubifs_images() {
    mkdir -p ${WORKDIR}/ubifs/
    touch ${WORKDIR}/ubifs/"DO NOT REMOVE THIS FILE"
    mkfs.ubifs -r ${WORKDIR}/ubifs/ -o ${WORKDIR}/default-state.ubifs ${MKUBIFS_BOOT_ARGS}
    mkfs.ubifs -r ${WORKDIR}/ubifs -o ${WORKDIR}/default-data.ubifs ${MKUBIFS_ARGS}
}

do_rootfs[prefuncs] += "resin_default_ubifs_images"

RESIN_BOOT_PARTITION_FILES_append_ccimx6ul = " \
    ${WORKDIR}/default-state.ubifs:/default-state.ubifs \
    ${WORKDIR}/default-data.ubifs:/default-data.ubifs \
"
