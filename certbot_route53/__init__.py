"""Certbot Route53 plugin."""
import logging
import sys
import warnings

import certbot_dns_route53

# Emit a DeprecationWarning and explicitly log because deprecation warnings are filtered by default.
DEPRECATION_MESSAGE = "certbot_route53 has been deprecated in favor of certbot_dns_route53"
warnings.warn(DEPRECATION_MESSAGE, DeprecationWarning)
logging.getLogger(__name__).warn(DEPRECATION_MESSAGE)

sys.modules['certbot_route53'] = certbot_dns_route53
