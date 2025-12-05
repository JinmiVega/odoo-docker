FROM odoo:18.0

LABEL MAINTAINER="Harrison Chumpitaz <hello@focuzai.com>"

USER root

#---------------------#
#   PIP Dependecies   #
#---------------------#
# Copy & Install PIP requirements

COPY --chown=odoo:odoo ./requirements.txt /tmp/requirements.txt

RUN pip3 install --break-system-packages -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

RUN mkdir -p /mnt/enterprise \
    && chown -R odoo /mnt/enterprise \
    && mkdir -p /mnt/themes \
    && chown -R odoo /mnt/themes
VOLUME ["/mnt/enterprise", "/mnt/themes"]

USER odoo