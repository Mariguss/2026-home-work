package company.vk.edu.distrib.compute.vredakon;

import java.io.IOException;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.concurrent.ConcurrentHashMap;

import company.vk.edu.distrib.compute.Dao;

public class DaoImpl<T> implements Dao<T> {

    private final Map<String, T> data = new ConcurrentHashMap<>();

    @Override
    public T get(String key) throws NoSuchElementException, IllegalArgumentException {
        return data.getOrDefault(key, null);
    }

    @Override
    public void delete(String key) {
        data.remove(key);
    }

    @Override
    public void upsert(String key, T value) {
        data.put(key, value);
    }

    @Override
    public void close() throws IOException {
        throw new IOException("Closed");
    }
}
