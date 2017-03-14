# Auto update
This manual describes on how to setup [WordPress' default update behaviour](https://codex.wordpress.org/Configuring_Automatic_Background_Updates) when using [trendwerk/bedrock](https://github.com/trendwerk/bedrock).

## 1. Allow file modifications
**Remove** this line from your configuration file:

```php
define('DISALLOW_FILE_MODS', true);
```

## 2. Disallow file editing
This disabled the "Editor" for themes and plugins. Add this to your configuration file:

```php
define('DISALLOW_FILE_EDIT', true');
```

## 3. Allow updates, even when using a VCS
By default WordPress searches for a VCS folder. If it finds one, it halts all updates. The following filter allows you to override this behaviour.

Add this filter upon initialization (for example, in your theme):

```php
add_filter('automatic_updates_is_vcs_checkout', '__return_false');
```

## 4. Capistrano rake task (optional)
Of course, the production code will not match to VCS code if you enable updates like this. To make sure you don't revert to wrong versions when deploying with Capistrano, you could add the rake task found in this repo.

Run it on before each deployment:

```
before :deploy, "deploy:confirm"
```
