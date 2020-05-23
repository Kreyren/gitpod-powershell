FROM gitpod/workspace-full

USER root

RUN true "" \
	&& apt-get update \
	# install the requirements
	&& apt-get install -y \
		less \
		locales \
		ca-certificates \
		libssl1.1 \
		libc6 \
		libgcc1 \
		libgssapi-krb5-2 \
		liblttng-ust0 \
		libstdc++6 \
		zlib1g \
		curl \
	# Download the powershell '.tar.gz' archive
	&& curl -L  https://github.com/PowerShell/PowerShell/releases/download/v7.0.1/powershell-7.0.1-linux-x64.tar.gz -o /tmp/powershell.tar.gz \
	# Create the target folder where powershell will be placed
	&& mkdir -p /opt/microsoft/powershell/7 \
	# Expand powershell to the target folder
	&& tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7 \
	# Set execute permissions
	&& chmod +x /opt/microsoft/powershell/7/pwsh \
	# Create the symbolic link that points to pwsh \
	&& ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
