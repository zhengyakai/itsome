package com.yakai.blog.service.impl;

import com.yakai.blog.service.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class RedisPool implements RedisUtils {

	@Autowired
    private JedisPool jedisPool;

	@Override
	public void set(String key, String value) {
		Jedis jedis = this.jedisPool.getResource();

		jedis.set(key, value);
		jedis.close();
	}

	@Override
	public String get(String key) {
		Jedis jedis = this.jedisPool.getResource();

		String result = jedis.get(key);
		jedis.close();

		return result;
	}

	@Override
	public void del(String key) {
		Jedis jedis = this.jedisPool.getResource();

		jedis.del(key);
		jedis.close();

	}

	@Override
	public void expire(String key, Integer seconds) {
		Jedis jedis = this.jedisPool.getResource();

		jedis.expire(key, seconds);
		jedis.close();

	}

	@Override
	public void set(String key, String value, Integer seconds) {
		Jedis jedis = this.jedisPool.getResource();

		jedis.set(key, value);
		jedis.expire(key, seconds);
		jedis.close();

	}

	@Override
	public Long incr(String key) {
		Jedis jedis = this.jedisPool.getResource();

		Long count = jedis.incr(key);
		jedis.close();

		return count;
	}
}