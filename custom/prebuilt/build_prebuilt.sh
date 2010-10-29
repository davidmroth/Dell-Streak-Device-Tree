PACKAGE=
SEARCH_DIRS=$(find . -maxdepth 1 \( ! -path "*backup*" -a ! -path "." \) -type d -print)

echo "LOCAL_PATH := \$(call my-dir)"
echo -en "\n\n"

#Shared Libraries
for module in $SEARCH_DIRS; do
	case ${module:2} in
		etc|media)
			for x in `find $module/ -type f`; do 
				NAME=$(basename ${x%.*})
				FILENAMEANDPATH=${x:2}

				echo "#$NAME"
				echo "file := \$(TARGET_OUT)/$FILENAMEANDPATH"
				echo "ALL_PREBUILT += \$(file)"
				echo "\$(file): \$(LOCAL_PATH)/$FILENAMEANDPATH | \$(ACP)"
				echo -en "\t\$(transform-prebuilt-to-target)\n"
				echo
			done
		;;

		*)
			for x in `find $module/ -type f`; do 
				NAME=$(basename ${x%.*})
				FILENAMEANDPATH=${x:2}
				DIRNAME=$(dirname $FILENAMEANDPATH)
				SUBDIRNAME=${DIRNAME/lib\/}


				echo "#$NAME"
				echo "include \$(CLEAR_VARS)"
				echo "LOCAL_MODULE := $NAME"
				echo "LOCAL_SRC_FILES := $FILENAMEANDPATH"

				case ${module:2} in
					app) 
						echo "LOCAL_MODULE_CLASS := APPS"
						echo "LOCAL_MODULE_TAGS := optional"
						echo "LOCAL_CERTIFICATE := platform"
						echo "LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)"
						echo "LOCAL_MODULE_PATH := \$(TARGET_OUT_APPS)"
						PACKAGE=$PACKAGE"\t$NAME \\\\\n"
					;;

					lib) 
						echo "LOCAL_MODULE_CLASS := SHARED_LIBRARIES"
						echo "LOCAL_MODULE_SUFFIX := \$(TARGET_SHLIB_SUFFIX)"
						if [ "$SUBDIRNAME" == "lib" ]; then
							echo "LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)"
						else
							echo "LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)/$SUBDIRNAME"
						fi
					;;

					framework) 
						echo "LOCAL_MODULE_CLASS := JAVA_LIBRARIES"
						echo "LOCAL_MODULE_SUFFIX := \$(COMMON_JAVA_PACKAGE_SUFFIX)"
						echo "LOCAL_MODULE_PATH := \$(TARGET_OUT_JAVA_LIBRARIES)"
					;;

				esac

				echo "include \$(BUILD_PREBUILT)"
				echo
			done
		;;
	esac
done


if [ ! "$PACKAGE" == "" ]; then
	echo -en "\n\n\n\n\n"
	echo "#ADD TO device/\$(PRODUCT_NAME)/\$(TARGET_PRODUCT)/\$(TARGET_PRODUCT).mk"
	echo "#PRODUCT_PACKAGES += \\"
	echo -en "$PACKAGE"
fi
