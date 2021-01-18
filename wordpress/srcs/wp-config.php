<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-svc.default.svc.cluster.local' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'SA:zy-GQV/455@_LfIW;OKWn[a}(9L0_4Fr7^3J;%V<cYO+A=8pT7J:PsAu1VnT1' );
define( 'SECURE_AUTH_KEY',  'GL.9(T!j6Dmg/Obubt;iP(7o-faMPp)+4im>9Oo.&BO?@D3z=d(]IOG^|L?_U.g<' );
define( 'LOGGED_IN_KEY',    '~4*rF41a/PdV,?V{_65bs2o`%{*w /KU%GzwZ-<!=WLuXL#Nar0{,ET}V$_DA5 h' );
define( 'NONCE_KEY',        'kU?|Xch61-P:T!FP%I0_Pi2-LVoyQt#a:oeCPi/Rcqv=4tSRkRf K+Tx.8a[QU2F' );
define( 'AUTH_SALT',        '1KZ`MZjFI`@v/3lP,+Dg`S3!  vNTJpGg9E9VF`QfRg>cVs;@RgYV:T5m_?|<I:o' );
define( 'SECURE_AUTH_SALT', 'f*f[`al=fdHkdX$|@hO(6C~XK4it1^Uzp|f?fIY*5ZS.4>*TL7~#R390_)gM~CW=' );
define( 'LOGGED_IN_SALT',   'f4yj)>&0HKd.!Kh-GKNh#(2*wf;MfwezXXe(`J0^2Q^cEIrjbc}0s$ZmQDC<>^b?' );
define( 'NONCE_SALT',       'S:;p9D&LO5#Eg/ItzJ)%!iei 3)s@<D(ELc5CVS|>4^-iBt=64p:DCDDBJL{(2aT' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';