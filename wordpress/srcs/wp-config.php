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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define('AUTH_KEY',         'ZZ&+YUfAd%;;ND;-welZ|AN&aBpH-tlA;PIEpEug@7HU:ro75F%sA:jZehaU(ZPu');
define('SECURE_AUTH_KEY',  ')svtO,T7F<ue{t?TS4,Si~@_{Ynp]8{F5eaiFV^QDG7NO}o&tCn+hJCv3jd];O{q');
define('LOGGED_IN_KEY',    '8l(.^-C#GD5)h;jjkw-1roSOJ,(B&un7{,qhF2}:_:vxN<|$^+P@||0R{a= UD!B');
define('NONCE_KEY',        'ikBP|eT,19ZL`teUFn-k`d<)w r*?@E`C_`~(dE-Vl /pRfx(-LVJ_Od>BaTP%tv');
define('AUTH_SALT',        '~PkArH,:ttucHRwSyWNHdZh8/R*Lm3kG-D7=*li[j?CyI.n|%grDG+c|&J!GR$m2');
define('SECURE_AUTH_SALT', 'Z[%vAe^XN+_UlW+|#64~rY]vA>FbWM5:4`O/LUL+f5GrBp/mL=+}6Sy4v1 OqFn?');
define('LOGGED_IN_SALT',   '+.V<)i=<C;`Gk@aLa*A(`IqNwwNV?E_xYgbU&oE,!StA-NP~uc!C!7uo%*zOzbSK');
define('NONCE_SALT',       '6f:`,:[sBd8-pwEYnHB;iY%)9idj<sb{M|HS;v6/9|rQ/[OZB>,6,HRMbe<QKb|=');
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
